import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faShuffle, faRotateLeft } from '@fortawesome/free-solid-svg-icons';
import React from 'react';
import Button from 'react-bootstrap/Button';
import OverlayTrigger from 'react-bootstrap/OverlayTrigger';
import Popover from 'react-bootstrap/Popover';
import {useState, useEffect} from 'react';
import Axios from 'axios';

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


  
function RulesTable({undoRule, rerollRule}) {

  const [rules, setData] = useState([]);

  // receive rules from get request
  useEffect(() => {
    Axios.get('/api2/rules').then((response) => {
      console.log({ data: response.data })
      setData(response.data);
    });
  }, []);

  const handleUndo = (genID) => {
    undoRule(genID);
  };

  const handleReroll = (genID) => {
    rerollRule(genID);
    window.location.reload(false);
  };

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
                <td id="rules">
                  <ul>
                    <li>{val.familyDescription} </li>
                    <li>Aspiration: {val.aspName} </li>
                    <li> Career: {val.careerName} </li>
                    <li> Trait: {val.traitName}  </li>
                    <li> Max the {val.skillName} skill </li>
                    <li> {val.miscDescription} </li>
                  </ul>
                </td>
                <td Link className="icon" onClick={() => handleUndo(val.genID)}><FontAwesomeIcon icon={faRotateLeft} /></td>
                <td Link className="icon" onClick={() => handleReroll(val.genID)}><FontAwesomeIcon icon={faShuffle} /></td>
              </tr>
          );
        })}
         </table>
      </div>
    );
}

export default RulesTable;