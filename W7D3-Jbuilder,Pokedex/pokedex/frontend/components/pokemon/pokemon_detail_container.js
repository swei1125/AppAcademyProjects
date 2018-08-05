import {connect} from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestAPokemon } from '../../actions/pokemon_actions';
import {withRouter} from 'react-router-dom';
import {selectPokemonItem, selectAllItems} from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => {
  // state.entities.pokemon[ownProps.match.params.pokemonId].itemIds.map(()=>{
  //
  // });
  return {
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId],
    items: selectAllItems(state)
  };
};


const mapDispatchToProps = (dispatch) => ({
  requestAPokemon: (pokemon) => dispatch(requestAPokemon(pokemon))
});

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(PokemonDetail));
