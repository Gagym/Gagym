const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
}

const showStar = () => {
	let target = document.querySelector(`#grade`);
    document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
}