import { fetchBenches } from './bench_actions';

export const UPDATE_BOUNDS = "UPDATE_BOUNDS";

export const changeBounds = (bounds) => ({
  type: UPDATE_BOUNDS,
  bounds
});

export const updateBounds = (bounds) => (dispatch, getState) => {
  dispatch(changeBounds(bounds));
  return fetchBenches(getState().ui.filters.bounds)(dispatch);
};
