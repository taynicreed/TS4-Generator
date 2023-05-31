// https://react-bootstrap.github.io/components/modal/

import React, { useState, useEffect } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Axios from 'axios';

export default function GenerateWarning() {
  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  const [rules, setData] = useState([]);

  // overwrite previous rules
  const overwritePrevRules = () => {
    handleClose();
    Axios.put('/api2/overwritePrevRules')
      .then(() => {
        console.log("success");
      })
      .catch((error) => {
        console.log(error);
      });
  };

  return (
    <>
    <button type="button" className="btn btn-light" onClick={handleShow}>Generate Rules</button>
      <Modal show={show} onHide={handleClose}>
        <Modal.Header >
          <Modal.Title>Warning</Modal.Title>
        </Modal.Header>
        <Modal.Body>This will overwrite previously generated rules.</Modal.Body>
        <Modal.Footer>
          <Button variant="primary" onClick={overwritePrevRules}>
            Okay
          </Button>
          <Button variant="secondary" onClick={handleClose}>
            Cancel
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
}