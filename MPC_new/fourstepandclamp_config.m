
function fourstepandclamp_config(this_block)

  % Revision History:
  %
  %   27-Feb-2025  (16:27 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     C:\marcos\MPC\fourstepandclamp.v
  %
  %

  this_block.setTopLevelLanguage('Verilog');

  this_block.setEntityName('fourstepandclamp');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('v');
  this_block.addSimulinkInport('dir');
  this_block.addSimulinkInport('clamp_signal');

  this_block.addSimulinkOutport('s1');
  this_block.addSimulinkOutport('s2');
  this_block.addSimulinkOutport('s3');
  this_block.addSimulinkOutport('s4');
  this_block.addSimulinkOutport('s5');
  this_block.addSimulinkOutport('s6');
  this_block.addSimulinkOutport('s7');
  this_block.addSimulinkOutport('s8');
  this_block.addSimulinkOutport('s9');
  this_block.addSimulinkOutport('s10');
  this_block.addSimulinkOutport('s11');
  this_block.addSimulinkOutport('s12');
  this_block.addSimulinkOutport('s13');
  this_block.addSimulinkOutport('s14');
  this_block.addSimulinkOutport('s15');
  this_block.addSimulinkOutport('s16');
  this_block.addSimulinkOutport('s17');
  this_block.addSimulinkOutport('s18');
  this_block.addSimulinkOutport('r');
  this_block.addSimulinkOutport('g');
  this_block.addSimulinkOutport('b');
  this_block.addSimulinkOutport('interrupt');

  s1_port = this_block.port('s1');
  s1_port.setType('UFix_1_0');
  s1_port.useHDLVector(false);
  s2_port = this_block.port('s2');
  s2_port.setType('UFix_1_0');
  s2_port.useHDLVector(false);
  s3_port = this_block.port('s3');
  s3_port.setType('UFix_1_0');
  s3_port.useHDLVector(false);
  s4_port = this_block.port('s4');
  s4_port.setType('UFix_1_0');
  s4_port.useHDLVector(false);
  s5_port = this_block.port('s5');
  s5_port.setType('UFix_1_0');
  s5_port.useHDLVector(false);
  s6_port = this_block.port('s6');
  s6_port.setType('UFix_1_0');
  s6_port.useHDLVector(false);
  s7_port = this_block.port('s7');
  s7_port.setType('UFix_1_0');
  s7_port.useHDLVector(false);
  s8_port = this_block.port('s8');
  s8_port.setType('UFix_1_0');
  s8_port.useHDLVector(false);
  s9_port = this_block.port('s9');
  s9_port.setType('UFix_1_0');
  s9_port.useHDLVector(false);
  s10_port = this_block.port('s10');
  s10_port.setType('UFix_1_0');
  s10_port.useHDLVector(false);
  s11_port = this_block.port('s11');
  s11_port.setType('UFix_1_0');
  s11_port.useHDLVector(false);
  s12_port = this_block.port('s12');
  s12_port.setType('UFix_1_0');
  s12_port.useHDLVector(false);
  s13_port = this_block.port('s13');
  s13_port.setType('UFix_1_0');
  s13_port.useHDLVector(false);
  s14_port = this_block.port('s14');
  s14_port.setType('UFix_1_0');
  s14_port.useHDLVector(false);
  s15_port = this_block.port('s15');
  s15_port.setType('UFix_1_0');
  s15_port.useHDLVector(false);
  s16_port = this_block.port('s16');
  s16_port.setType('UFix_1_0');
  s16_port.useHDLVector(false);
  s17_port = this_block.port('s17');
  s17_port.setType('UFix_1_0');
  s17_port.useHDLVector(false);
  s18_port = this_block.port('s18');
  s18_port.setType('UFix_1_0');
  s18_port.useHDLVector(false);
  r_port = this_block.port('r');
  r_port.setType('UFix_8_0');
  g_port = this_block.port('g');
  g_port.setType('UFix_8_0');
  b_port = this_block.port('b');
  b_port.setType('UFix_8_0');
  interrupt_port = this_block.port('interrupt');
  interrupt_port.setType('UFix_1_0');
  interrupt_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('v').width ~= 5);
      this_block.setError('Input data type for port "v" must have width=5.');
    end

    if (this_block.port('dir').width ~= 3);
      this_block.setError('Input data type for port "dir" must have width=3.');
    end

    if (this_block.port('clamp_signal').width ~= 1);
      this_block.setError('Input data type for port "clamp_signal" must have width=1.');
    end

    this_block.port('clamp_signal').useHDLVector(false);

  end  % if(inputTypesKnown)
  % -----------------------------

  % -----------------------------
   if (this_block.inputRatesKnown)
     setup_as_single_rate(this_block,'clk','ce')
   end  % if(inputRatesKnown)
  % -----------------------------

    uniqueInputRates = unique(this_block.getInputRates);


  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  this_block.addFile('fourstepandclamp.v');
  this_block.addFile('four_step.v');
  this_block.addFile('decoder.v');

return;


% ------------------------------------------------------------

function setup_as_single_rate(block,clkname,cename) 
  inputRates = block.inputRates; 
  uniqueInputRates = unique(inputRates); 
  if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
  end 
  if (uniqueInputRates(end) == Inf) 
     hasConstantInput = true; 
     uniqueInputRates = uniqueInputRates(1:end-1); 
  end 
  if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
  end 
  theInputRate = uniqueInputRates(1); 
  for i = 1:block.numSimulinkOutports 
     block.outport(i).setRate(theInputRate); 
  end 
  block.addClkCEPair(clkname,cename,theInputRate); 
  return; 

% ------------------------------------------------------------

