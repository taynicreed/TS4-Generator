import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faShuffle, faRotateLeft } from '@fortawesome/free-solid-svg-icons';
import React from 'react';
import Button from 'react-bootstrap/Button';
import OverlayTrigger from 'react-bootstrap/OverlayTrigger';
import Popover from 'react-bootstrap/Popover';

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
    return (
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
                    </th>                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td id="rules">2 kids<br></br>Get divorced as an elder<br></br>Complete the postcard collection</td>
                    <td Link className="icon"><FontAwesomeIcon icon={faRotateLeft} /></td>
                    <td Link className="icon"><FontAwesomeIcon icon={faShuffle} /></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td id="rules">All kids must be adopted<br></br>Complete the Animal Lover aspiration<br></br>Max the handiness and fitness skills</td>
                    <td Link className="icon"><FontAwesomeIcon icon={faRotateLeft} /></td>
                    <td Link className="icon"><FontAwesomeIcon icon={faShuffle} /></td>
                </tr>
            </tbody>
        </table>
    );
}

export default RulesTable;