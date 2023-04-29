
import 'bootstrap/dist/css/bootstrap.min.css';

import './App.css';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Layout from './App';
import ReactDOM from 'react-dom';
import HomePage from './pages/HomePage';
import InstructionsPage from './pages/InstructionsPage';
import OptionsPage from './pages/OptionsPage';


export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<HomePage />} />
          <Route path="options" element={<OptionsPage />} />
          <Route path="/instructions" element={<InstructionsPage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

ReactDOM.render(<App />, document.getElementById("root"));
