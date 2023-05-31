// https://react-bootstrap.github.io/components/modal/

import React, { useState, useEffect } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Axios from 'axios';

export default function GenerateWarning({onOverwritePrevRules}) {
  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

    const handleGenerate = () => {
        const gensToUpdate = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        // Call the onOverwritePrevRules prop with the gensToUpdate
        onOverwritePrevRules(gensToUpdate);
        handleClose();
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
          <Button variant="primary" onClick={handleGenerate}>
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