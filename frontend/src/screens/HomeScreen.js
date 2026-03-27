import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import MapView from '../components/MapView'; // Adjust the path if necessary

const HomeScreen = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Welcome to JeepWaze!</Text>
      <MapView />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingTop: 50, // Example padding
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
  },
});

export default HomeScreen;