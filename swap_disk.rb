Facter.add(:swap_disk) do
  # A fact for Linux that check if you configured swap to disk
  confine :kernel => 'Linux'
  setcode do
    swap = Facter::Core::Execution.exec('cat /proc/swaps | grep -v zram | grep -v Filename')
    if swap == ""
      false
    else
      true
    end
  end
end
