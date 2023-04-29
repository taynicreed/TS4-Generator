// client/src/App.js

import React from "react";
import "./App.css";

function App() {
  const [data, setData] = React.useState(null);
  const [data2, setData2] = React.useState(null);


  React.useEffect(() => {
    fetch("/api1/api")
      .then((res) => res.json())
      .then((data) => setData(data.message));
    fetch("/api2/api")
      .then((res) => res.json())
      .then((data2) => setData2(data2.message));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <p>{!data ? "Loading..." : data}</p>
        <p>{!data2 ? "Loading..." : data2}</p>
      </header>
    </div>
  );
}

export default App;
