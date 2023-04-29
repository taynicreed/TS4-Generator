// https://reactjssnippet.com/posts/how-to-check-all-checkbox-in-react-js/
import React from "react";

export default class MyComponent extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      expansionPacks: [
        { id: "ep1", label: "Get To Work\n", checked: true },
        { id: "ep2", label: "Get Together", checked: true },
        { id: "ep3", label: "City Living", checked: true },
        { id: "ep4", label: "Cats & Dogs\n", checked: true },
        { id: "ep5", label: "Seasons\n", checked: true },
        { id: "ep6", label: "Get Famous", checked: true },
        { id: "ep7", label: "Island Living", checked: true },
        { id: "ep8", label: "Discover University", checked: true },
        { id: "ep9", label: "Eco Lifestyle", checked: true },
        { id: "ep10", label: "Snowy Escape", checked: true },
        { id: "ep11", label: "Cottage Living", checked: true },
        { id: "ep12", label: "High School Years", checked: true },
        { id: "ep13", label: "Growing Together", checked: true },
        ],
      gamePacks: [
        { id: "gp1", label: "Outdoor Retreat", checked: true },
        { id: "gp2", label: "Spa Day Pack", checked: true },
        { id: "gp3", label: "Dine Out Pack", checked: true },
        { id: "gp4", label: "Vampires Pack", checked: true },
        { id: "gp5", label: "Parenthood", checked: true },
        { id: "gp6", label: "Jungle Adventures", checked: true },
        { id: "gp7", label: "StrangerVille", checked: true },
        { id: "gp8", label: "Realm of Magic", checked: true },
        { id: "gp9", label: "Journey to Batuu", checked: true },
        { id: "gp10", label: "Dream Home Decorator", checked: true },
        { id: "gp11", label: "My Wedding Stories", checked: true },
        { id: "gp12", label: "Werewolves", checked: true }
      ],
      stuffPacks: [
        { id: "sp1", label: "Cool Kitchen Stuff", checked: true },
        { id: "sp2", label: "Spooky Stuff", checked: true },
        { id: "sp3", label: "Movie Hangout Stuff", checked: true },
        { id: "sp4", label: "Romantic Garden Stuff", checked: true },
        { id: "sp5", label: "Kids Room Stuff", checked: true },
        { id: "sp6", label: "Vintage Glamour Stuff", checked: true },
        { id: "sp7", label: "Bowling Night Stuff", checked: true },
        { id: "sp8", label: "Fitness Stuff", checked: true },
        { id: "sp9", label: "Toddler Stuff", checked: true },
        { id: "sp10", label: "Laundry Day", checked: true },
        { id: "sp11", label: "My First Pet Stuff", checked: true },
        { id: "sp12", label: "Moschino Stuff", checked: true },
        { id: "sp13", label: "Tiny Living Stuff", checked: true },
        { id: "sp14", label: "Nifty Knitting Stuff", checked: true },
        { id: "sp15", label: "Paranormal Stuff", checked: true }



    ],
      kits: [
        { id: "k1", label: "\nBust the Dust Kit", checked: true },
        { id: "k2", label: "Little Campers Kit", checked: true },
      ]
    };
  }

  selectAll() {
    const changeAll = this.state.expansionPacks.map((checkbox) => {
      return { ...checkbox, checked: true };
    });

    const changeAll2 = this.state.gamePacks.map((checkbox) => {
        return { ...checkbox, checked: true };
      });
    
    const changeAll3 = this.state.stuffPacks.map((checkbox) => {
    return { ...checkbox, checked: true };
    });

    const changeAll4 = this.state.kits.map((checkbox) => {
        return { ...checkbox, checked: true };
    });

    this.setState({
      expansionPacks: changeAll,
      gamePacks: changeAll2,
      stuffPacks: changeAll3,
      kits: changeAll4
    });
  }

  deselectAll() {
    const changeAll = this.state.expansionPacks.map((checkbox) => {
      return { ...checkbox, checked: false };
    });

    const changeAll2 = this.state.gamePacks.map((checkbox) => {
        return { ...checkbox, checked: false };
    });

    const changeAll3 = this.state.stuffPacks.map((checkbox) => {
        return { ...checkbox, checked: false };
    });

    const changeAll4 = this.state.kits.map((checkbox) => {
        return { ...checkbox, checked: false };
    });

    this.setState({
        expansionPacks: changeAll,
        gamePacks: changeAll2,
        stuffPacks: changeAll3,
        kits: changeAll4
    });
  }

  handleChange(checkboxId) {
    let expansionPacks = this.state.expansionPacks;
    for (let checkbox of expansionPacks) {
      if (checkbox.id === checkboxId) {
        checkbox.checked = !checkbox.checked;
      }
    }
    this.setState({ expansionPacks: expansionPacks });

    let gamePacks = this.state.gamePacks;
    for (let checkbox of gamePacks) {
      if (checkbox.id === checkboxId) {
        checkbox.checked = !checkbox.checked;
      }
    }

    this.setState({ gamePacks: gamePacks });

    let stuffPacks = this.state.stuffPacks;
    for (let checkbox of stuffPacks) {
      if (checkbox.id === checkboxId) {
        checkbox.checked = !checkbox.checked;
      }
    }
    this.setState({ stuffPacks: stuffPacks });

    let kits = this.state.kits;
    for (let checkbox of kits) {
      if (checkbox.id === checkboxId) {
        checkbox.checked = !checkbox.checked;
      }
    }
    this.setState({ kits: kits });
  }

  render() {
    return (
      <div className="container">
        <div>
        <label><strong>Expansion Packs</strong><br/></label>
        {this.state.expansionPacks.map((checkbox) => (
          <label key={checkbox.id}>
            <input
              type="checkbox"
              checked={checkbox.checked}
              onChange={() => this.handleChange(checkbox.id)}
            />
            {checkbox.label}
          </label>
        ))}
        <br />
        </div>

        <div>
        <label><strong>Game Packs</strong><br/></label>
        {this.state.gamePacks.map((checkbox) => (
          <label key={checkbox.id}>
            <input
              type="checkbox"
              checked={checkbox.checked}
              onChange={() => this.handleChange(checkbox.id)}
            />
            {checkbox.label}
          <br />
          </label>
        ))}
        </div>

        <div>
        <label><strong>Stuff Packs</strong><br/></label>
        {this.state.stuffPacks.map((checkbox) => (
          <label key={checkbox.id}>
            <input
              type="checkbox"
              checked={checkbox.checked}
              onChange={() => this.handleChange(checkbox.id)}
            />
            {checkbox.label}
            <br />
          </label>
        ))}
        </div>

        <div>
        <label><strong>Kit Packs<br/></strong></label>
        {this.state.kits.map((checkbox) => (
          <label key={checkbox.id}>
            <input
              type="checkbox"
              checked={checkbox.checked}
              onChange={() => this.handleChange(checkbox.id)}
            />
            {checkbox.label}
            <br />
          </label>
        ))}
        <br />
        </div>
        
        <br />
        <button type="button" class="btn btn-light" onClick={() => this.selectAll()}>Select all</button>
        <button type="button" class="btn btn-light" onClick={() => this.deselectAll()}>Deselect All</button>
      </div>
    );
  }
}