// https://react-bootstrap.github.io/components/modal/

import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';

export default function GenerateRules({generateAllRules}) {
  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

    const handleGenerate = () => {
        const gensToUpdate = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        // Call the generateAllRules prop with the gensToUpdate
        generateAllRules(gensToUpdate);
        handleClose();
        window.location.reload(false);
    };


  return (
    <>
    <Button variant="success" onClick={handleShow}>Generate Rules</Button>
      <Modal show={show} onHide={handleClose}>
        <Modal.Header >
          <Modal.Title>Warning</Modal.Title>
        </Modal.Header>
        <Modal.Body>This will overwrite all current rules.</Modal.Body>
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