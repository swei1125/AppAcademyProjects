import {values} from 'lodash';

export const selectAllPokemon = (state) => {
  return values(state.entities.pokemon);
};

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId];
};

export const selectAllItems = (state) => {
  return values(state.entities.items);
};
