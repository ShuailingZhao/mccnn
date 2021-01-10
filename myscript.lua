cmd = torch.CmdLine()
cmd:text()
cmd:text()
cmd:text('Training a simple network')
cmd:text()
cmd:text('Options')
cmd:option('-seed',123,'initial random seed')
cmd:option('-booloption',false,'boolean option')
cmd:option('-stroption','mystring','string option')
cmd:text()

-- parse input params
params = cmd:parse(arg)

params.rundir = cmd:string('experiment', params, {dir=true})
paths.mkdir(params.rundir)

-- create log file
cmd:log(params.rundir .. '/log', params)
