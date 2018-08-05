import React from 'react';
import { withRouter } from 'react-router-dom';

class PokemonForm extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      name: "",
      image_url: "",
      poke_type: "normal",
      attack: "",
      defense: "",
      move1: "",
      move2: ""
    };
    this.update = this.update.bind(this);
    this.createPokemon = this.createPokemon.bind(this);
  }

  createPokemon(e){
    e.preventDefault();

    let poke = {
      name: this.state.name,
      image_url: this.state.image_url,
      poke_type: this.state.poke_type,
      attack: parseInt(this.state.attack),
      defense: parseInt(this.state.defense),
      moves: [this.state.move1, this.state.move2]
    };

    this.props.createAPokemon(poke).then((newPoke) => {this.props.history.push(`pokemon/${newPoke.id}`);});
    this.setState({name: "",
          image_url: "",
          poke_type: "normal",
          attack: "",
          defense: "",
          move1: "",
          move2: ""}
        );

  }

  update(field){
    return (e) => (this.setState({[field]: e.target.value}));
  }

  render(){
    return (
      <div className='pokemon-form'>
        <form onSubmit={this.createPokemon}>
          <input type="text" onChange={this.update("name")} value={this.state.name} placeholder="Name"></input>
          <input type="text" onChange={this.update("image_url")} value={this.state.image_url} placeholder="Image Url"></input>

          <select onChange={this.update("poke_type")}>
            <option value="normal">normal</option>
            <option value="fire">fire</option>
            <option value="fighting">fighting</option>
            <option value="water">water</option>
            <option value="flying">flying</option>
            <option value="grass">grass</option>
            <option value="poison">poison</option>
            <option value="electric">electric</option>
            <option value="ground">ground</option>
            <option value="psychic">psychic</option>
            <option value="rock">rock</option>
            <option value="ice">ice</option>
            <option value="bug">bug</option>
            <option value="dragon">dragon</option>
            <option value="ghost">ghost</option>
            <option value="steel">steel</option>
          </select>

          <input type="text" onChange={this.update("attack")} value={this.state.attack} placeholder="Attack"></input>
          <input type="text" onChange={this.update("defense")} value={this.state.defense} placeholder="Defense"></input>
          <input type="text" onChange={this.update("move1")} value={this.state.move1} placeholder="Move 1"></input>
          <input type="text" onChange={this.update("move2")} value={this.state.move2} placeholder="Move 2"></input>
          <button type='submit'>Create Pokemon</button>
        </form>

      </div>
    );
  }
}

export default withRouter(PokemonForm);
