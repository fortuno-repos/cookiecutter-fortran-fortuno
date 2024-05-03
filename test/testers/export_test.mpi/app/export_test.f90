program export_test
  use mpi_f08, only : MPI_Comm, MPI_Comm_rank, MPI_COMM_WORLD, MPI_Finalize, MPI_Init
  use testproject, only : broadcast
  implicit none

  type(MPI_Comm) :: comm
  integer :: rank
  integer :: buffer

  call MPI_Init()
  comm = MPI_COMM_WORLD
  call MPI_Comm_rank(comm, rank)
  if (rank == 0) then
    buffer = 1
  end if
  call broadcast(comm, buffer, 0)
  print "(a, i2.2, a, i0)", 'Rank: ', rank, '| buffer = ', buffer
  call MPI_Finalize()

end program export_test
