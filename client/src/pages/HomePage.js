import React from 'react';
import RulesTable from '../components/RulesTable';
import GenerateWarning from '../components/warning'
import {Link} from "react-router-dom";
import { saveAs } from 'file-saver';
import Axios from 'axios';


function SaveFile() {
  var blob = new Blob(["Hello, world!"], {type: "text/plain;charset=utf-8"});
  saveAs(blob, "legacy_challenge.txt");
}

function HomePage() {
    // generate new rule(s)
    const generateRules = (gensToUpdate) => {
      console.log('gensToUpdate: ', gensToUpdate);
      markRulesAsUnused(gensToUpdate);
      overwritePrevRules(gensToUpdate);

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

    const rerollRule = (genID) => {
      generateRules([genID]);
    };

  
    // undo rule
    const undoRule = (genID) => {

      Axios.get(`/api2/prevRules/${genID}`)
        .then((response) => {
          const prevRules = response.data[0];
          console.log(prevRules);
          overwritePrevRules([genID]);
          fillRulesFromCache(genID, prevRules);
        });
    };

    // fill Rules from cache
    const fillRulesFromCache = (genID, prevRules) => {
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
        <Link to="/options">
        <button type="button" className="btn btn-light">Options</button>
        </Link>

        <Link to="/instructions">
        <button type="button" className="btn btn-light">Instructions</button>
        </Link>
      </div>

      <div >
      <GenerateWarning 
        generateAllRules={generateRules}
      />
      </div>

      <div className="rules">
        <h2>Your Legacy Challenge</h2>
        <RulesTable 
          undoRule={undoRule}
          rerollRule={rerollRule}
        />
      </div>
      
      <div className="btns">
        <button type="button" className="btn btn-light" onClick={SaveFile}>Save</button>
        <Link to="/name">
        <button type="button" className="btn btn-light">Name Generator</button>
        </Link>      
        </div>

    </div>


  );
}

export default HomePage;

