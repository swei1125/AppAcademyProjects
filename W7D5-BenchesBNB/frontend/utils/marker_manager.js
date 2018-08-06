export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    const benchObj = {};
    benches.forEach(bench => {
      benchObj[bench.id] = bench;
      if (!this.markers[bench.id]) {
        const marker = this.createMarkerFromBench(bench);
        Object.assign(this.markers, {[bench.id]: marker});
        marker.setMap(this.map);
      }
    });
    Object.keys(this.markers).forEach(id => {
      if (!benchObj[id]) {
        this.markers[id].setMap(null);
        delete this.markers[id];
      }
    });

  }

  createMarkerFromBench(bench) {
     const pos = new google.maps.LatLng(bench.lat, bench.lng);
     const marker = new google.maps.Marker({
      position: pos,
      map: this.map
    });
    return marker
  }
}
