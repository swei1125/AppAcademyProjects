import {UPDATE_BOUNDS} from '../actions/filter_actions';
import {UPDATE_FILTER} from '../actions/bench_actions';

const defaultState = {
  bounds:{},
  minSeating: 1,
  maxSeating: 10
};

const filterReducer = (state=defaultState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case UPDATE_BOUNDS:
      return Object.assign({}, state, {bounds: action.bounds});
    case UPDATE_FILTER:
      return Object.assign({}, state, {[action.filter]: action.value});
    default:
      return state;
  }
};

export default filterReducer;
