export const fetchBenches = (bounds) => {
  return $.ajax({
    method: 'GET',
    url: 'api/benches',
    data: {bounds},
    error: (err) => console.log(err)
  });
};

export const createBench = (bench) => (
  $.ajax({
    method: 'POST',
    url: 'api/benches',
    data: {bench}
  })
);
// {
// northEast: {lat: 37.80971, lng: -122.39208},
// southWest: {lat: 37.74187, lng: -122.47791}
// }
