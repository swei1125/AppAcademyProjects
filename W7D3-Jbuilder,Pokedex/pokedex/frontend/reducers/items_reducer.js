import { RECEIVE_A_POKEMON} from '../actions/pokemon_actions';
import {merge} from 'lodash';

const itemsReducer = (state = {}, action) => {
  let nextState = merge({}, state);
  switch (action.type) {
    case RECEIVE_A_POKEMON:
      return action.payload.items ? action.payload.items : {};
    default:
      return state;
  }
};

export default itemsReducer;
