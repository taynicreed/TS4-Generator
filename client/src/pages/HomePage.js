import React from 'react';
import RulesTable from '../components/RulesTable';
import GenerateWarning from '../components/warning'
import {Link} from "react-router-dom";
import { saveAs } from 'file-saver';


function SaveFile() {
  var blob = new Blob(["Hello, world!"], {type: "text/plain;charset=utf-8"});
  saveAs(blob, "legacy_challenge.txt");
}

function HomePage() {

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
        <button type="button" class="btn btn-light">Options</button>
        </Link>

        <Link to="/instructions">
        <button type="button" class="btn btn-light">Instructions</button>
        </Link>
      </div>

      <div >
      <GenerateWarning />
        </div>

      <div className="rules">
        <h2>Your Legacy Challenge</h2>
        <RulesTable />
      </div>
      
      <div className="btns">
        <button type="button" class="btn btn-light" onClick={SaveFile}>Save</button>
      </div>

    </div>


  );
}

export default HomePage;
