import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import {Route, Switch} from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonFormContainer from './pokemon_form_container';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon(this.props.pokemon);
  }

  render() {
    return (
      <section className="pokedex">
        <Switch>
          <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer} />
          <Route exact path='/' component={PokemonFormContainer} />
        </Switch>
        <ul>
          {this.props.pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />)}
        </ul>
      </section>

    );
  }
}

export default PokemonIndex;
