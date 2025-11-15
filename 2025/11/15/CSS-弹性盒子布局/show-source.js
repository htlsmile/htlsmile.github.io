function showSource(elementId, url) {
    fetch(url)
        .then(response => response.text())
        .then(data => {
            const templateContent = extractTemplate(data);
            if (!templateContent) {
                console.error('No <template> found in the provided URL.');
                return;
            }
            document.getElementById(elementId).innerHTML = templateContent;
        });
}

// 从内容中提取template标签
function extractTemplate(content) {
    // 使用正则表达式匹配<template>标签
    const templateRegex = /<template[^>]*>([\s\S]*?)<\/template>/i;
    const match = content.match(templateRegex);

    if (match && match[1]) {
        return match[1].trim();
    }

    return null;
}