Resample aggregate function combinator
ex- countResample, sumResample, avgResample, groupArrayResample
syntax:
aggFunctionResample(start, stop, step)(aggFunction_col, resampling_col)

'Outputs an array'


'Example'

create table sensor_data(timing datetime, temperature float)
order by timing

INSERT INTO sensor_data VALUES
('2025-08-21 00:00:00', 25.1),
('2025-08-21 00:30:00', 25.5),
('2025-08-21 01:15:00', 26.0),
('2025-08-21 01:45:00', 26.3),
('2025-08-21 02:05:00', 25.8),
('2025-08-21 02:50:00', 25.0);



select avgResample(toUnixTimestamp('2025-08-21 00:00:00'), toUnixTimestamp('2025-08-21 03:00:00'), 3600)
(temperature, timing)
from sensor_data



select countResample(120, 190, 10)(`Product Name`, `Units Sold`) from practicedb.product


-------------------------------------------------------------------------------------------














