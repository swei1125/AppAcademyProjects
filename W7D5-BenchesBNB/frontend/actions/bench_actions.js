import * as BenchAPI from '../utils/bench_api_util';

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const RECEIVE_BENCH = "RECEIVE_BENCH";

export const receiveBenches = benches => ({
  type: RECEIVE_BENCHES,
  benches
});

export const receiveBench = bench => ({
  type: RECEIVE_BENCH,
  bench
});

export const fetchBenches = (bounds) => dispatch => (
  BenchAPI.fetchBenches(bounds)
  .then(benches => dispatch(receiveBenches(benches)))
);

export const createBench = (bench) => dispatch => (
  BenchAPI.createBench(bench)
  .then(
    newBench => dispatch(receiveBench(newBench)
  ))
);
