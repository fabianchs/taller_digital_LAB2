`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//El siguiente módulo está basado en el libro FPGA prototyping with verilog examples
module debounce_module(clk, reset, sw, db

    );
    
    input logic clk, reset;
    input logic sw;
    output logic db;
    
    //declaración de los estados
    
    localparam [2:0]
        zero=3'b000,
        wait1_1= 3'b001,
        wait1_2=3'b010,
        wait1_3=3'b011,
        one=3'b100,
        wait0_1=3'b101,
        wait0_2=3'b110,
        wait0_3=3'b111;
        
    //número de contador de bits (2^N*20nS= 10ms tick)
    
    localparam N=19;
    
    //declaración de las señales
    
    logic [N-1:0] q_reg;
    logic [N-1:0] q_next;
    logic m_tick;
    logic [2:0] state_reg, state_next;
    
    //desarrollo
    
    //=============================
    //Contador para generar un tick de 10ms
    //=============================
    always @(posedge clk)
        q_reg<=q_next;
        //lógica del siguiente estado
        assign q_next=q_reg+1;
        //tick de salida
        assign m_tick=(q_reg==0) ? 1'b1: 1'b0;
        
    //=============================
    //Máquina de estados del sistema antirebote
    //=============================
    
    //estado del registro
    //~
    always @(posedge clk, posedge reset)
        if (reset)
            state_reg<=zero;
        else
            state_reg<=state_next;
     
     //lógica del siguiente estado y salida lógica
     
     always @*
     begin
        state_next = state_reg; //estado default: el mismo
        db=1'b0;
        
        case (state_reg)
            zero:
                if(sw)
                    state_next=wait1_1;
             wait1_1:
                if(~sw)
                    state_next= zero;
                else
                    if (m_tick)
                        state_next= wait1_2;
             wait1_2:
                if(~sw)
                    state_next= zero;
                else
                    if (m_tick)
                        state_next= wait1_3;
             wait1_3:
                if(~sw)
                    state_next=zero;
                else
                    if (m_tick)
                        state_next= one;
              one:
                begin 
                    db=1'b1;
                    if(~sw)
                        state_next= wait0_1;
                end  
               wait0_1:
                    begin
                        db=1'b1;
                        if(~sw)
                            state_next=one;
                        else
                            if (m_tick)
                                state_next= wait0_2;
                    end
                wait0_2:
                    begin
                        db=1'b1;
                        if(sw)
                            state_next=one;
                        else
                            if(m_tick)
                                state_next=wait0_3;
                    end    
                wait0_3:
                    begin
                        db=1'b1;
                        if(sw)
                            state_next=one;
                        else
                            if(m_tick)
                            state_next=zero;
                    end   
                default: state_next=zero;
        endcase
     end
    
    
endmodule
