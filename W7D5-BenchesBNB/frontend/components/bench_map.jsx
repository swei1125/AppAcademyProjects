import React from 'react';
import ReactDOM from 'react-dom';
import MarkerManager from '../utils/marker_manager';

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount(){
    const mapOptions = {
      center: {lat: 37.7758, lng: -122.435},
      zoom: 13
    };
    const map = ReactDOM.findDOMNode(this.refs.map);

    this.map = new google.maps.Map(map, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);
    this.listenForMove();
  }


  listenForMove() {
    /*
     * we listen for the map to emit an 'idle' event, it does this when
     * the map stops moving
     */
    google.maps.event.addListener(this.map, 'idle', () => {
      const LatLngBounds = this.map.getBounds();
      alert('map has moved, check console to see updated bounds');

      // console.log('center',
      //   LatLngBounds.getCenter().lat(),
      //   LatLngBounds.getCenter().lng());
      // console.log("north east",
      //   LatLngBounds.getNorthEast().lat(),
      //   LatLngBounds.getNorthEast().lng());
      // console.log("south west",
      //   LatLngBounds.getSouthWest().lat(),
      //   LatLngBounds.getSouthWest().lng());

      const ne_lat = LatLngBounds.getNorthEast().lat();
      const ne_lng = LatLngBounds.getNorthEast().lng();
      const sw_lat = LatLngBounds.getSouthWest().lat();
      const sw_lng = LatLngBounds.getSouthWest().lng();

      const bounds = {northEast: {lat: ne_lat, lng: ne_lng}, southWest: {lat: sw_lat, lng: sw_lng}};

      this.props.updateBounds(bounds);
    });
  }

  componentDidUpdate() {
    this.MarkerManager.updateMarkers(this.props.benches);
  }
  render() {
    return (
      <div id='map-container' ref='map'></div>
    );
  }
}

export default BenchMap;
