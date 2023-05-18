import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faShuffle, faRotateLeft } from '@fortawesome/free-solid-svg-icons';
import React from 'react';
import Button from 'react-bootstrap/Button';
import OverlayTrigger from 'react-bootstrap/OverlayTrigger';
import Popover from 'react-bootstrap/Popover';
import {useState, useEffect} from 'react';
import Axios from 'axios';

//import { faArrowRotateLeft } from '@fortawesome/media-playback';
//const rerollIcon = <FontAwesomeIcon icon={faArrowRotateLeft} />;
const popover1 = (
    <Popover id="popover-basic">
      <Popover.Body>
        Go back to the previous rules for this generation.
      </Popover.Body>
    </Popover>
  );

const popover2 = (
    <Popover id="popover-basic">
      <Popover.Body>
        Generate new rules for this generation only.
      </Popover.Body>
    </Popover>
  );


  
function RulesTable() {

  const [rules, setData] = useState([]);

  // receive rules from get request
  useEffect(() => {
    Axios.get('/api2/rules').then((response) => {
      console.log('hi')
      console.log({ data: response.data })
      //console.log(response.data)
      setData(response.data);
    });
  }, []);

      return (
        <div>
        <table>
            <thead>
                <tr>
                    <th>Generation</th>
                    <th>Rules</th>
                    <th> Undo  <OverlayTrigger trigger="click" placement="right" overlay={popover1}>
                        <Button variant="success">?</Button>
                        </OverlayTrigger>
                    </th>
                    <th> Reroll  <OverlayTrigger trigger="click" placement="left" overlay={popover2}>
                        <Button variant="success">?</Button>
                        </OverlayTrigger>
                    </th>                
                </tr>
            </thead>

      {Array.isArray(rules) && rules.map((val) => {
        return (
              <tr>
                <td>{val.genID}</td>
                <td>
                  {val.familyID}
                  Complete the {val.aspID} aspiration <br></br>
                  Finish the {val.careerID} career <br></br>
                  Have the {val.traitID} trait <br></br>
                  Max the {val.skillID} skill <br></br>
                  {val.miscID}
                </td>
                <td Link className="icon"><FontAwesomeIcon icon={faRotateLeft} /></td>
                <td Link className="icon"><FontAwesomeIcon icon={faShuffle} /></td>
              </tr>
          );
        })}
         </table>
      </div>
    );
}

export default RulesTable;