# Coin Changing
Basic Finite State Machine with Datapath (FSMD) to compute the minimum number of coins to make change for a given amount. The input is
the data stored in in denom array that specifies the denominations of the coins, denom[1]>denom[2]>...>denom[n] = 1,
and an Amount A(4 bits). The output is an array C whose value,C[i][j], is the minimum number of coins to make change for the amount j,
using coins i through n(4 bits), 1<=i<=n, 0<=j<=A.

## Notes :
- The denom array is rom/ram 4 x 4 bits.
- The denom array indices should start from 0 to 3, but the program works on indices from 1 to 3.
- The C matrix rows indices should start from 0 to 3, but the program works on rows indices from 1 to 3.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem2219/dynamic_coin_change.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd dynamic_coin_change
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, A = 12. Note : the denom array contents is specified in rom_4x4bit.vhd:

    ```sh
    $ vsim work.tb
    ```
6. Add the following commands to the transcript
```sh
    $ add wave -position end  sim:/tb/dut/C_matrix/program
    $ run 19ns
    ```
