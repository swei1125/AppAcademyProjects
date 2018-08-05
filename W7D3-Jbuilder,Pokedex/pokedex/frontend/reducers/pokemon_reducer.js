import {RECEIVE_ALL_POKEMON, RECEIVE_A_POKEMON} from '../actions/pokemon_actions';
import {merge} from 'lodash';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = merge({}, state);

  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge(nextState, action.pokemon);
    case RECEIVE_A_POKEMON:
      return merge(nextState, {[action.payload.pokemon.id]: action.payload.pokemon});
    default:
      return state;
  }
};

export default pokemonReducer;
