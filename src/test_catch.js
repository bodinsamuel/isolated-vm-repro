let ivm = require('isolated-vm');
let isolate = new ivm.Isolate;
let context = isolate.createContextSync();
let global = context.global;

( async () => {

  const script = `
  function recur() {
    return recur();
  }
  recur();
  `;

  try {
    const compiled = await isolate.compileScript(script);
    await compiled.run(context);
  } catch(err) {
    console.log('[Error has been caught, node has not crashed]');
    console.error(err);
  }

  console.log('Done');
})()
