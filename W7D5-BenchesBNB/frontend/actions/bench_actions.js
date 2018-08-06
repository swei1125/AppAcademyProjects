import * as BenchAPI from '../utils/bench_api_util';

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";

export const receiveBenches = benches => ({
  type: RECEIVE_BENCHES,
  benches
});

export const fetchBenches = (bounds) => dispatch => (
  BenchAPI.fetchBenches(bounds)
  .then(benches => dispatch(receiveBenches(benches)))
);
