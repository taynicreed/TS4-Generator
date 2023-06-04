
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

      <div className="instructions">
        <h2>
            What is a legacy challenge?
        </h2>
        <p>
            The goal of a legacy challenge is to play through 10 generations with the same family.
            You can find many different legacy challenges online that have been created by other players.
            This Legacy Challenge Generator will help you create a unique and random legacy challenge for your game.
        </p>
      </div>

      <div className="instructions">
        <h2>
            How to use this app
        </h2> 
        <p>
          <ol>
            <li>Click the "Options" button and select all of the packs and kits you want to include in your legacy challenge</li>
            <li>Click the "Generate" button and review your legacy challenge rules.</li>
            <li>If you are unhappy with the rules you can click "Generate" again to get a whole new 
            set of rules, or you can "reroll" generations individually. 
            You can click the "undo" button to go back to the previous set of rules for that generation.</li>
            <li>Click the "Save" button to download a copy of your rules to your device.</li>
          </ol>
        </p>
        <p>
          For additional fun, you can use the name generator to generate names for your legacy family members.
        </p>
      </div>

      <div className="instructions">
        <h2>
          Format of the rules
        </h2>
      <p>
            The rules for your legacy challenge will be generated randomly based on the packs and kits that you select. 
            The format of the rules will be as follows:
          </p>
            <p>
            <ol>
            <li>A family rule such as "Marry the first person you date" or "All children must be adopted".</li>
            <li>The aspiration that your sim must complete.</li>
            <li>A career. If your sim gets a "Self-Employed" career then they will make money by doing the described tasks, rather than having a traditional career</li>
            <li>A trait that your sim must have. You are free to choose their other two traits.</li>
            <li>A skill that your sim must max.</li>
            <li>A miscellaneous rule for the generation, such as "Bring a ghost back to life with Ambrosia".</li>
            </ol>
        </p>
      </div>
    </div>


  );
}

export default InstructionsPage;

