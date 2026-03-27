import React from 'react';
import { View, StyleSheet } from 'react-native';
import MapboxGL from '@rnmapbox/maps';

MapboxGL.setAccessToken('YOUR_MAPBOX_ACCESS_TOKEN'); // Replace with your actual access token

const MapView = () => {
  return (
    <View style={styles.page}>
      <View style={styles.container}>
        <MapboxGL.MapView style={styles.map} />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  page: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  },
  container: {
    height: 300,
    width: 300,
    backgroundColor: 'white'
  },
  map: {
    flex: 1
  }
});

export default MapView;