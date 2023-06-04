import React from "react";
import Axios from "axios";
import PackList from '../components/Packs';

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
              Select Your Packs  
              </strong>    
            </h1>
          <h3>
            Select the packs you own to get custom rules for your legacy challenge.
          </h3>
          <h3>
            This list only includes packs with gameplay features.
          </h3>

          <PackList 
            onPackSelection={handlePackSelection}
          />

          <div className="packs">
          </div>
        </div>

   
      </div>
  
  
    );
  }
  
  export default OptionsPage;
  
  