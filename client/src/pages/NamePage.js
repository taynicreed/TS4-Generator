// Code based on https://bobbyhadz.com/blog/react-fetch-data-on-button-click
import {useState} from 'react';


const NamePage = () => {
  const [data, setData] = useState({data: []});
  const [err, setErr] = useState('');

const handleClick = async () => {
    try {
      const response = await fetch('/api1/name');

      if (!response.ok) {
        throw new Error(`Error! status: ${response.status}`);
      }

      const result = await response.json();

      console.log('result is: ', JSON.stringify(result, null, 4));

      setData(result);

    } catch (err) {
      setErr(err.message);
    } 
  };

  console.log(data);

  return (
    <div className="App">
      <h1>Name Generator</h1>
      <p>Click the button below to generate a random name for your sim.</p>
      <button type="button" className="btn btn-light" onClick={handleClick}>Get Name</button>
      {err && <h2>{err}</h2>}

        <h2>{data.name}</h2>

        <div >
      </div>
     </div>
  );
};

export default NamePage;