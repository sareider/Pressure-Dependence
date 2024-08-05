""" This script fits a TASOPT model intended to replicate Harlass cruise data at 11000 m """

### Loading Packages
using Revise
using TASOPT

### Defining file destination
csv_dest = "Pressure Dependence/FuelFlowVars_1.csv"

### Initializing default aircraft model
ac = load_default_model()

### Defining parameters
# fuel_flows = [0.405, 0.450, 0.495]                 # Represent, -10%, 0%, 10%
fuel_flows = [0.405]                 # Represent, -10%, 0%, 10%

### Looping over OPR and compressor efficiency values to size different aircrafts
for fuel_flow in fuel_flows
    ac.pare[3,:,:] .=fuel_flow
    
    # Sizing aircraft and storing desired data
    size_aircraft!(ac)
    # output_csv(ac, csv_dest, indices=output_indices_all, includeFlightPoints=true)
end