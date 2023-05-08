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
    
  /*const [data, setData] = React.useState(null);
  const [data2, setData2] = React.useState(null);

  React.useEffect(() => {
    fetch("/api1/api")
      .then((res) => res.json())
      .then((data) => setData(data.message));
    fetch("/api2/api")
      .then((res) => res.json())
      .then((data2) => setData2(data2.message));
  }, []);*/
  

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
        <Link to="/name">
        <button type="button" class="btn btn-light">Name Generator</button>
        </Link>      
        </div>

    </div>


  );
}

export default HomePage;

