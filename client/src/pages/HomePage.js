import React from 'react';
import Axios from 'axios';
import Button from 'react-bootstrap/esm/Button';
import { saveAs } from 'file-saver';
import RulesTable from '../components/RulesTable';
import GenerateRules from '../components/generateRules'

// save rules to txt file
function SaveFile() {
  Axios.get('/api2/rules')
    .then((response) => {
      const rules = response.data;

      // format rules
      const formattedRules = rules.map(rule => {
        return `Generation ${rule.genID}\n` +
        `Family: ${rule.familyDescription}\n` +
        `Aspiration: ${rule.aspName}\n` +
        `Career: ${rule.careerName}\n` +
        `Trait: ${rule.traitName}\n` +
        `Skill: ${rule.skillName}\n` +
        `Misc: ${rule.miscDescription}\n\n`;
      });

      const rulesString = formattedRules.join("\n");
      const blob = new Blob([rulesString], {type: "text/plain;charset=utf-8"});
      saveAs(blob, "legacy_challenge.txt");
    })
    .catch((error) => {
      console.log(error);
    });
};

function HomePage() {

    // generate new rules for one or all generations
    const generateRules = (gensToUpdate) => {
      console.log('gensToUpdate: ', gensToUpdate);
      markRulesAsUnused(gensToUpdate);
      overwritePrevRules(gensToUpdate);

      // send request for each generation separately to avoid duplicate rules
      gensToUpdate.forEach(gen => {
        console.log('sending to generateRules: ', {genToUpdate: gen});
        Axios.put('/api2/generateRules', { genToUpdate: gen})
          .then(() => {
            console.log("success");
          })
          .catch((error) => {
            console.log(error);
          });
        });
    };

    // mark rules in PrevRules as unused
    const markRulesAsUnused = (gensToUpdate) => {
      Axios.put('/api2/unusedRules', gensToUpdate)
        .then(() => {
          console.log("success");
        })
        .catch((error) => {
          console.log(error);
        });
    };

    // overwrite previous rules
    const overwritePrevRules = (gensToUpdate) => {
      Axios.put('/api2/overwritePrevRules', gensToUpdate)
        .then(() => {
          console.log("success");
        })
        .catch((error) => {
          console.log(error);
        });
    };

    // generate new rules for one generation
    const rerollRule = (genID) => {
      generateRules([genID]);
    };

    // undo rules for one generation
    const undoRule = (genID) => {
      Axios.get(`/api2/prevRules/${genID}`)
        .then((response) => {
          const prevRules = response.data[0];
          overwritePrevRules([genID]);
          fillRulesFromTemp(genID, prevRules);
        });
    };

    // fill Rules from temp
    const fillRulesFromTemp = (genID, prevRules) => {
      console.log("Making Axios put req with ", genID, prevRules)
      Axios.put('/api2/fillRules', {genToUpdate: genID, prevRules: prevRules})
        .then(() => {
          window.location.reload(false);
          console.log("success");
        });
    };
  
  return (
    <div className="App">
      <div>
        <header className="App-header">
          <h1>
            The Sims 4 
            <br></br>
            Legacy Challenge Generator        
          </h1>
        </header>
      </div>

      <div className="two-btn">
      <GenerateRules 
        generateAllRules={generateRules}
      />&nbsp;&nbsp;&nbsp;
      <Button variant="secondary" onClick={SaveFile}>Save Rules</Button>
      </div>

      <div className="rules">
        <h2>Your Legacy Challenge</h2>
        <RulesTable 
          undoRule={undoRule}
          rerollRule={rerollRule}
        />
      </div>
    </div>
  );
}

export default HomePage;

