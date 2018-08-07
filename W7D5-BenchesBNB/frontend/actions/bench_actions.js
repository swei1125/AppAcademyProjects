import * as BenchAPI from '../utils/bench_api_util';

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const RECEIVE_BENCH = "RECEIVE_BENCH";
export const UPDATE_FILTER = "UPDATE_FILTER";

export const receiveBenches = benches => ({
  type: RECEIVE_BENCHES,
  benches
});

export const receiveBench = bench => ({
  type: RECEIVE_BENCH,
  bench
});

export const changeFilter = (filter, value) => ({
  type: UPDATE_FILTER,
  filter,
  value
});

export const updateFilter = (filter, value) => (dispatch, getState) => {
  dispatch(changeFilter(filter, value));
  return fetchBenches(getState().ui.filters)(dispatch);
};

export const fetchBenches = (filters) => dispatch => (
  BenchAPI.fetchBenches(filters)
  .then(benches => dispatch(receiveBenches(benches)))
);

export const createBench = (bench) => dispatch => (
  BenchAPI.createBench(bench)
  .then(
    newBench => dispatch(receiveBench(newBench)
  ))
);
