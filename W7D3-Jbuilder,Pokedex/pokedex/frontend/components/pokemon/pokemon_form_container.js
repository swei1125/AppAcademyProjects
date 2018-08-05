import {connect} from 'react-redux';
import {createAPokemon} from '../../actions/pokemon_actions';
import PokemonForm from './pokemon_form';

const mapDispatchToProps = (dispatch) => ({
 createAPokemon: pokemon => dispatch(createAPokemon(pokemon))
});


export default connect(null, mapDispatchToProps)(PokemonForm);
