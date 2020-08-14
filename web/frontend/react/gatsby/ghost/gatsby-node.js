const path = require('path');

exports.createPages = async ({ graphql, actions }) => {

    const postTemplate = path.resolve(`./src/templates/post.js`);

    const { createPage } = actions;
    const result = await graphql(`
    allGhostPost(filter: {authors: {elemMatch: {name: {eq: "Ghost"}}}}) {
        edges {
          node {
            slug
          }
        }
      }
    `);
    const posts = result.data.allGhostPost.edges;
    posts.forEach(({post, i}) => {
        createPage({
            path: i === 0 ? post : `${post.slug}page/${i + 1}/`,
            component: postTemplate,
            context: {
                // Data passed to context is available
                // in page queries as GraphQL variables.
                slug: post.slug,
                // limit: postsPerPage,
                // skip: i * postsPerPage,
                // numberOfPages: numberOfPages,
                // humanPageNumber: currentPage,
                // prevPageNumber: prevPageNumber,
                // nextPageNumber: nextPageNumber,
                // previousPagePath: previousPagePath,
                // nextPagePath: nextPagePath,
            },
        }) 
    });
}