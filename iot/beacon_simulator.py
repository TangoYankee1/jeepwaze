import random
import time

class Beacon:
    def __init__(self, id, location):
        self.id = id
        self.location = location

    def transmit(self):
        # Simulate beacon signal transmission
        signal = f"Beacon {self.id} at {self.location} is transmitting."
        print(signal)

class BeaconSimulator:
    def __init__(self):
        self.beacons = []

    def add_beacon(self, beacon):
        self.beacons.append(beacon)

    def start_simulation(self, duration):
        end_time = time.time() + duration
        while time.time() < end_time:
            for beacon in self.beacons:
                beacon.transmit()
                time.sleep(random.uniform(0.5, 1.5))  # Random interval between transmissions

# Example usage
if __name__ == '__main__':
    simulator = BeaconSimulator()
    simulator.add_beacon(Beacon(1, "Location A"))
    simulator.add_beacon(Beacon(2, "Location B"))
    simulator.start_simulation(10)  # Simulate for 10 seconds
