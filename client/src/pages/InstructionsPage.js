import {Link} from "react-router-dom";


function InstructionsPage() {

    return (
    <div className="App">
      <div>
        <header className="App-header">
          <h1>
            Instructions      
          </h1>
        </header>
      </div>

      <div>
        <h2>
            What is a legacy challenge?
        </h2>
        <p>
            The goal of a legacy challenge is to complete a number of generations, 
            usually 10, while following specific rules. There are tons of legacy 
            challenges online, some following specific themes and others being random. 
            This Legacy Challenge Generator will randomize unique rules so you can create 
            your very own challenge.
        </p>
      </div>

      <div>
        <h2>
            How to use this app
        </h2> 
        <p>
            1. Click the "Options" button and select all of the packs and kits that you own.<br></br>
            2. Click the "Generate" button and review your legacy challenge rules.<br></br>
            3. If you are unhappy with the rules you can click "Generate" again to get a whole new 
            set of rules, or you can "reroll" generations individually. After rerolling the rules
            for a generation you can click the "undo" button to go back to the previous set of rules.<br></br>
            4. Click the "Save" button to download a copy of your rules to your device.
        </p>
      </div>

      <div>
        <h2>
            Video Guide
        </h2>
        <p> 
            ~insert video here~
        </p>
      </div>

      <div >
        <Link to="/">
          <button type="button" className="btn btn-light">Home</button>
        </Link>
      </div>

    </div>


  );
}

export default InstructionsPage;

