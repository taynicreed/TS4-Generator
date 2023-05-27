import {Link} from "react-router-dom";
import PackList from '../components/Packs';
import Button from 'react-bootstrap/Button';

function OptionsPage() {
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

          <PackList />

          <div className="packs">
          </div>
          <p>Don't see a pack on the list? Only packs with gameplay features are included.</p>
        </div>
  
        <div>
          <h2>
              Other Options
          </h2> 
          <h3>
            Length
          </h3>
          <p>
              Select how long your legacy challenge should be.<br />
              <select name="generations" id="generations">
                <option value="10">10 generations</option>
                <option value="9">9 generations</option>
                <option value="8">8 generations</option>
                <option value="7">7 generations</option>
                <option value="6">6 generations</option>
                <option value="5">5 generations</option>
                <option value="4">4 generations</option>
                <option value="3">3 generations</option>
                <option value="2">2 generations</option>
                <option value="1">1 generation</option>
              </select>
          </p>
        </div>

        <div>
          <div className="two-btn">
            <Link to="/">
            <Button variant="primary" className="btn btn-light">Apply Changes</Button>
            </Link>
            <Link to="/">
            <Button variant="secondary" className="btn btn-light">Cancel</Button>
            </Link>
          </div>
        </div>
        <p>After applying changes, click the "generate" button on the home page to get updated results.</p>

      </div>
  
  
    );
  }
  
  export default OptionsPage;
  
  