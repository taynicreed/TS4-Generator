import Container from 'react-bootstrap/Container';
import Navbar from 'react-bootstrap/Navbar';
import Nav from 'react-bootstrap/Nav';

function navbar() {
  return (
      <Navbar fixed="top" variant="light" bg="light">
        <Container>
          <Nav.Link href="/">Home</Nav.Link>
          <Nav.Link href="/instructions">How to Use</Nav.Link>
          <Nav.Link href="/options">Options</Nav.Link>
          <Nav.Link href="/name">Name Generator</Nav.Link>
        </Container>
      </Navbar>
  );
}

export default navbar;