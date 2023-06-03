import React from 'react';
import Button from 'react-bootstrap/Button';
import Axios from 'axios';
import { saveAs } from 'file-saver';

export default function SaveFile() {
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
      return(
        <Button variant="secondary" onClick={SaveFile}>Save Rules</Button>
      );
  }