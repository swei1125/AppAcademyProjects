import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_A_POKEMON = "RECEIVE_A_POKEMON";

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveAPokemon = (payload) => ({
  type: RECEIVE_A_POKEMON,
  payload
});


export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const requestAPokemon = (id) => (dispatch) => (
  APIUtil.fetchAPokemon(id)
    .then(payload => dispatch(receiveAPokemon(payload)))
);

export const createAPokemon = (pokemon) => (dispatch) => (
  APIUtil.createAPokemon(pokemon)
    .then((pokemon) => {
      dispatch(receiveAPokemon(pokemon));
      return pokemon;
    })
);
