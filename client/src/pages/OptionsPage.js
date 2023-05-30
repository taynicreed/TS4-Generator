import React, { useState, useEffect } from "react";
import {Link} from "react-router-dom";
import Button from 'react-bootstrap/Button';

import PackList from '../components/Packs';
import Axios from "axios";


function OptionsPage() {
    // Update database with new pack selections on submit
    const handlePackSelection = (updatedPacks) => {
      Axios.put('/api2/packOptions', updatedPacks)
        .then(() => {
          console.log("success");
        })
        .catch((error) => {
          console.log(error);
        });
    };

    return (
      <div className="App">
        <div>
            <h1>
              <strong>
              Options  
              </strong>    
            </h1>
          <h2>
              Packs
          </h2>
          <h3>
            Select the packs you own to create customized rules
          </h3>

          <PackList 
            onPackSelection={handlePackSelection}
          />

          <div className="packs">
          </div>
          <p>Don't see a pack on the list? Only packs with gameplay features are included.</p>
        </div>

   
      </div>
  
  
    );
  }
  
  export default OptionsPage;
  
  