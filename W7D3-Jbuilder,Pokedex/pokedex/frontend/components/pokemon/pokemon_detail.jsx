import React from 'react';
import {Route, Link} from 'react-router-dom';
import ItemDetailContainer from './item_detail_container';

class PokemonDetail extends React.Component{
  constructor (props) {
    super(props);
    console.log(props.match.params);
    console.log(props.pokemon);
  }

  componentDidMount(){
    this.props.requestAPokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps){
    if(this.props.match.params.pokemonId !== newProps.match.params.pokemonId)
      this.props.requestAPokemon(newProps.match.params.pokemonId);
  }

  render () {
    if(this.props.pokemon === undefined) {
      return null;
    }
    return (
      <section className='pokemon-detail'>
        <img src={this.props.pokemon.imageUrl} />
        <h2>{this.props.pokemon.name}</h2>
        <ul>
          <li>Type: {this.props.pokemon.pokeType}</li>
          <li>Attack: {this.props.pokemon.attack}</li>
          <li>Defense: {this.props.pokemon.defense}</li>
          <li>Moves: {this.props.pokemon.moves ? this.props.pokemon.moves.join(', ') : null}</li>
        </ul>
        <ul>
          {
            this.props.items.map((item, idx)=>(
              <span key={idx}><Link to={`/pokemon/${this.props.pokemon.id}/items/${item.id}`}><img src ={item.imageUrl} style={{height:75, width: 75}}/></Link></span>
            ))
          }
        </ul>
        <Route path="/pokemon/:pokemonId/items/:itemId" component={ItemDetailContainer}/>
      </section>
    );
  }
}

export default PokemonDetail;
