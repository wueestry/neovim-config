local api = vim.api

api.nvim_command([[
  command! ColconBuild :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
]])
api.nvim_command([[
  command! -nargs=1 ColconBuildSingle :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON --packages-up-to <args>
]])
api.nvim_command([[
  command! ColconBuildDebug :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug
]])
api.nvim_command([[
  command! -nargs=1 ColconBuildDebugSingle :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug --packages-up-to <args>

]])

-- Test
api.nvim_command([[
  command! ColconTest :! colcon test
]])
api.nvim_command([[

  command! -nargs=1 ColconTestSingle :! colcon test --packages-select <args>
]])
api.nvim_command([[
  command! ColconTestResult :! colcon test-result --all
]])
