
struct = load('MMSI');
mmsi = struct.MMSI;

struct = load('shiptypeOriginal');
shiptypeOriginal = struct.shiptype;
mmsiAndType = cell(3000000,2);

mmsiAndType = [num2cell(mmsi),shiptypeOriginal];
mmsiAndType = sortrows(mmsiAndType,1);

mmsi = cell2mat(mmsiAndType(:,1));

shiptypeOriginal = mmsiAndType(:,2);

shipTypes = [];
for i = 1:size(otherMmsi,1)
    index = find_closest_index(mmsi,otherMmsi(i));
    if mmsi(index) == otherMmsi(i)
        shipTypes = [shipTypes,shiptypeOriginal(index)];
    end
end

%STATS
% General Cargo: 44
% Live Fish Carrier: 19
% PAssenger ship: 49
% Ro-ro : 676
% Other: 50
% Total: 844 ish