require 'benchmark'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'
require_relative 'poorly_written_ruby'

array1 = (1..33).to_a.shuffle!
array2 = (34..66).to_a.shuffle!
array3 = (67..100).to_a.shuffle!

array4 = (1..333).to_a.shuffle!
array5 = (334..666).to_a.shuffle!
array6 = (667..1000).to_a.shuffle!

array7 = (1..3333).to_a.shuffle!
array8 = (3334..6666).to_a.shuffle!
array9 = (6667..10000).to_a.shuffle!

array10 = (1..33333).to_a.shuffle!
array11 = (33334..66666).to_a.shuffle!
array12 = (66667..100000).to_a.shuffle!

Benchmark.bm(100) do |x|
  # x.report('poorly written - 100') {poorly_written_ruby(array1, array2, array3)}
  # x.report('poorly written - 1000') {poorly_written_ruby(array4, array5, array6)}
  # x.report('poorly written - 10000') {poorly_written_ruby(array7, array8, array9)}
  # x.report('poorly written - 100000') {poorly_written_ruby(array10, array11, array12)}
  # x.report('well written - 100') {well_written_ruby(array1, array2, array3)}
  # x.report('well written - 1000') {well_written_ruby(array4, array5, array6)}
  # x.report('well written - 10000') {well_written_ruby(array7, array8, array9)}
  # x.report('well written - 100000') {well_written_ruby(array10, array11, array12)}
  x.report('better written - 100') {better_written_ruby(array1, array2, array3)}
  x.report('better written - 1000') {better_written_ruby(array4, array5, array6)}
  x.report('better written - 10000') {better_written_ruby(array7, array8, array9)}
  x.report('better written - 100000') {better_written_ruby(array10, array11, array12)}
  x.report('best written - 100') {best_written_ruby(array1, array2, array3)}
  x.report('best written - 1000') {best_written_ruby(array4, array5, array6)}
  x.report('best written - 10000') {best_written_ruby(array7, array8, array9)}
  x.report('best written - 100000') {best_written_ruby(array10, array11, array12)}
end
